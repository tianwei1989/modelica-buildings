within Buildings.Applications.DataCenters.ChillerCooled.Equipment.BaseClasses;
partial model SignalFilter  "Partial model that implements the filtered opening for valves and dampers"
  extends Buildings.Applications.DataCenters.ChillerCooled.Equipment.BaseClasses.SignalFilterParameters;
protected
  Modelica.Blocks.Interfaces.RealOutput[numFil] y_actual "Actual valve position"
    annotation (Placement(transformation(extent={{-28,66},{-12,82}})));
  Modelica.Blocks.Continuous.Filter[numFil] filter(
     each order=2,
     each f_cut=5/(2*Modelica.Constants.pi*riseTimeValve),
     each final init=initValve,
     final y_start=yValve_start,
     each final analogFilter=Modelica.Blocks.Types.AnalogFilter.CriticalDamping,
     each final filterType=Modelica.Blocks.Types.FilterType.LowPass,
     x(each stateSelect=StateSelect.always)) if use_inputFilter
    "Second order filters to approximate valve opening time, and to improve numerics"
    annotation (Placement(transformation(extent={{-54,78},{-42,90}})));
  Modelica.Blocks.Interfaces.RealOutput[numFil] y_filtered if use_inputFilter
    "Filtered valve positions in the range 0..1"
    annotation (Placement(transformation(extent={{-28,76},{-12,92}}),
        iconTransformation(extent={{60,50},{80,70}})));
equation
 connect(filter.y,y_filtered)
   annotation (Line(points={{-41.4,84},{-32,84},{-20,84}},
      color={0,0,127}));
 if use_inputFilter then
   connect(filter.y, y_actual)
     annotation (Line(points={{-41.4,84},{-32,84},{-32,74},{-20,74}},
       color={0,0,127}));
 end if;
  annotation (    Documentation(revisions="<html>
<ul>
<li>
June 30, 2017, by Yangyang Fu:<br/>
First implementation.
</li>
</ul>
</html>", info="<html>
<p>
Partial model that implements the filters that are used to approximate the travel time of the actuators.
The signal <code>y_actual</code> is used to obtain the current position of the actuators.
</p>
</html>"));
end SignalFilter;
