within Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.Economizers.Subsequences;
block FreProTMix "Optional freeze protection block based on mixed air temperature."

  parameter Boolean use_enthalpy = true
    "Set to true to evaluate outdoor air enthalpy in addition to temperature"
    annotation(Dialog(group="Conditional"));
  parameter Modelica.SIunits.TemperatureDifference delTOutHis=1
    "Delta between the temperature hysteresis high and low limit"
    annotation(Evaluate=true, Dialog(tab="Advanced", group="Hysteresis"));
  parameter Modelica.SIunits.SpecificEnergy delEntHis=1000
    "Delta between the enthalpy hysteresis high and low limits"
    annotation(Evaluate=true, Dialog(tab="Advanced", group="Hysteresis", enable = use_enthalpy));
  parameter Modelica.SIunits.Time retDamFulOpeTim=180
    "Time period to keep RA damper fully open before releasing it for minimum outdoor airflow control
    at disable to avoid pressure fluctuations"
    annotation(Evaluate=true, Dialog(tab="Advanced", group="Delays at disable"));
  parameter Modelica.SIunits.Time disDel=15
    "Short time delay before closing the OA damper at disable to avoid pressure fluctuations"
    annotation(Evaluate=true, Dialog(tab="Advanced", group="Delays at disable"));

  parameter Modelica.SIunits.Temperature TFreSet = 277.15
    "Lower limit for mixed air temperature for freeze protection"
     annotation(Evaluate=true, Dialog(tab="Advanced", group="Freeze protection"));
  parameter Real kPFre = 1
    "Proportional gain for mixed air temperature tracking for freeze protection"
     annotation(Evaluate=true, Dialog(tab="Advanced", group="Freeze protection"));

  Buildings.Controls.OBC.CDL.Interfaces.RealInput TMix(
    final unit="K",
    final quantity = "ThermodynamicTemperature")
    "Measured mixed air temperature, used for freeze protection"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}), iconTransformation(extent={{-120,
            -10},{-100,10}})));

  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yOutDamPos(
    final unit="1",
    final min=0,
    final max=1) "Maximum outdoor air damper position which prevents freezing" annotation (
      Placement(transformation(extent={{100,20},{120,40}}),   iconTransformation(extent={{100,-70},
            {120,-50}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yRetDamPos(
    final unit="1",
    final min=0,
    final max=1) "Minimum return air damper position during freeze protection" annotation (
      Placement(transformation(extent={{100,-40},{120,-20}}),
                                                            iconTransformation(extent={{100,50},{
            120,70}})));

  Buildings.Controls.OBC.CDL.Continuous.AddParameter yFreOut(final p=1, final k=
       -1) "Control signal for outdoor damper due to freeze protection"
    annotation (Placement(transformation(extent={{40,20},{60,40}})));

  Buildings.Controls.OBC.CDL.Continuous.LimPID conFreTMix(
    final controllerType=Buildings.Controls.OBC.CDL.Types.SimpleController.P,
    final k=kPFre,
    final yMax=1,
    final yMin=0)
    "Controller for mixed air to track freeze protection set point"
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));

protected
  final parameter Modelica.SIunits.TemperatureDifference TOutHigLimCutHig = 0
    "Hysteresis high limit cutoff";
  final parameter Real TOutHigLimCutLow = TOutHigLimCutHig - delTOutHis
    "Hysteresis low limit cutoff";
  final parameter Modelica.SIunits.SpecificEnergy hOutHigLimCutHig = 0
    "Hysteresis block high limit cutoff";
  final parameter Real hOutHigLimCutLow = hOutHigLimCutHig - delEntHis
    "Hysteresis block low limit cutoff";

  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant setPoiFre(
    final k=TFreSet)
    "Set point for freeze protection"
    annotation (Placement(transformation(extent={{-50,0},{-30,20}})));
  Buildings.Controls.OBC.CDL.Continuous.AddParameter offSig(
    final k=1,
    final p=-1/kPFre)
    "Offset of TMix to account for P-band. This ensures that the damper is fully closed at TFreSet"
    annotation (Placement(transformation(extent={{-50,-40},{-30,-20}})));
equation

  connect(conFreTMix.y,yFreOut. u) annotation (Line(points={{11,10},{20,10},{20,30},{38,30}},
                                    color={0,0,127}));
  connect(conFreTMix.u_s, setPoiFre.y)
    annotation (Line(points={{-12,10},{-29,10}},     color={0,0,127}));
  connect(TMix, offSig.u) annotation (Line(points={{-120,0},{-80,0},{-80,-30},{-52,-30}},
                        color={0,0,127}));
  connect(offSig.y, conFreTMix.u_m) annotation (Line(points={{-29,-30},{0,-30},{0,-2}},
                       color={0,0,127}));
  connect(yFreOut.y, yOutDamPos) annotation (Line(points={{61,30},{110,30}},   color={0,0,127}));
  connect(conFreTMix.y, yRetDamPos)
    annotation (Line(points={{11,10},{60,10},{60,-30},{110,-30}},
                                                                color={0,0,127}));
  annotation (
    defaultComponentName = "freProTMix",
    Icon(graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-164,144},{164,106}},
          lineColor={0,0,127},
          textString="%name"),
        Line(
          points={{-20,-46},{-20,40},{36,40},{-20,40},{-20,2},{26,2}},
          color={0,0,127},
          thickness=0.5)}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-60},{100,60}},
        initialScale=0.05)),
Documentation(info="<html>
<p>

</p>
</html>", revisions="<html>
<ul>
<li>
November 2, 2017, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"));
end FreProTMix;