within Buildings.Controls.OBC.CDL.Logical.Validation;
model TrueFalseHold "Validation model for the TrueFalseHold block"
extends Modelica.Icons.Example;

  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul(
      startTime=0, period=1500) "Boolean pulse input signal"
    annotation (Placement(transformation(extent={{-140,60},{-120,80}})));
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol(trueHoldDuration=1000)
    "The block introduces a minimal offset between the input signal rising and falling edge"
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul1(
    startTime=0,
    period=1000,
    width=0.25) "Boolean pulse input signal"
    annotation (Placement(transformation(extent={{-140,20},{-120,40}})));
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol1(trueHoldDuration=1000)
    "The block introduces a minimal offset between the input signal rising and falling edge"
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul2(
      startTime=0, period=1500) "Boolean pulse input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-120,0}})));
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol2(trueHoldDuration=1000)
    "The block introduces a minimal offset between the input signal rising and falling edge"
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul3(
    startTime=0,
    period=1000,
    width=0.25) "Boolean pulse input signal"
    annotation (Placement(transformation(extent={{-140,-60},{-120,-40}})));
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol3(trueHoldDuration=1000)
    "The block introduces a minimal offset between the input signal rising and falling edge"
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Buildings.Controls.OBC.CDL.Logical.Not not1
    "Negation of input signal"
    annotation (Placement(transformation(extent={{-90,-20},{-70,0}})));
  Buildings.Controls.OBC.CDL.Logical.Not not3
    "Negation of input signal"
    annotation (Placement(transformation(extent={{-90,-60},{-70,-40}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul4(
      startTime=100, period=1500) "Boolean pulse input signal"
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol4(trueHoldDuration=1000)
    "The block introduces a minimal offset between the input signal rising and falling edge"
    annotation (Placement(transformation(extent={{120,60},{140,80}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul5(
    startTime=100,
    period=1000,
    width=0.25) "Boolean pulse input signal"
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol5(trueHoldDuration=1000)
    "The block introduces a minimal offset between the input signal rising and falling edge"
    annotation (Placement(transformation(extent={{120,20},{140,40}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul6(
      startTime=100, period=1500) "Boolean pulse input signal"
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol6(trueHoldDuration=1000)
    "The block introduces a minimal offset between the input signal rising and falling edge"
    annotation (Placement(transformation(extent={{120,-20},{140,0}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul7(
    startTime=100,
    period=1000,
    width=0.25) "Boolean pulse input signal"
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol7(trueHoldDuration=1000)
    "The block introduces a minimal offset between the input signal rising and falling edge"
    annotation (Placement(transformation(extent={{120,-60},{140,-40}})));
  Buildings.Controls.OBC.CDL.Logical.Not not2
    "Negation of input signal"
    annotation (Placement(transformation(extent={{70,-20},{90,0}})));
  Buildings.Controls.OBC.CDL.Logical.Not not4
    "Negation of input signal"
    annotation (Placement(transformation(extent={{70,-60},{90,-40}})));
equation
  connect(booPul.y, truFalHol.u)
    annotation (Line(points={{-119,70},{-80,70},{-41,70}},
                                                      color={255,0,255}));
  connect(booPul1.y, truFalHol1.u)
    annotation (Line(points={{-119,30},{-41,30}},   color={255,0,255}));
  connect(booPul2.y, not1.u)
    annotation (Line(points={{-119,-10},{-92,-10}}, color={255,0,255}));
  connect(not1.y, truFalHol2.u)
    annotation (Line(points={{-69,-10},{-41,-10}},   color={255,0,255}));
  connect(booPul3.y, not3.u)
    annotation (Line(points={{-119,-50},{-92,-50}}, color={255,0,255}));
  connect(not3.y, truFalHol3.u)
    annotation (Line(points={{-69,-50},{-41,-50}},   color={255,0,255}));
  connect(booPul4.y, truFalHol4.u)
    annotation (Line(points={{41,70},{119,70}},   color={255,0,255}));
  connect(booPul5.y, truFalHol5.u)
    annotation (Line(points={{41,30},{119,30}},   color={255,0,255}));
  connect(booPul6.y, not2.u)
    annotation (Line(points={{41,-10},{68,-10}}, color={255,0,255}));
  connect(not2.y, truFalHol6.u)
    annotation (Line(points={{91,-10},{119,-10}},   color={255,0,255}));
  connect(booPul7.y, not4.u)
    annotation (Line(points={{41,-50},{68,-50}}, color={255,0,255}));
  connect(not4.y, truFalHol7.u)
    annotation (Line(points={{91,-50},{119,-50}},   color={255,0,255}));
  annotation (
  experiment(StopTime=7200.0, Tolerance=1e-06),
  __Dymola_Commands(
  file="modelica://Buildings/Resources/Scripts/Dymola/Controls/OBC/CDL/Logical/Validation/TrueFalseHold.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
Validation test for the block
<a href=\"modelica://Buildings.Controls.OBC.CDL.Logical.TrueFalseHold\">
Buildings.Controls.OBC.CDL.Logical.TrueFalseHold</a>.
</p>
<p>
The validation uses different instances to validate different hold trueHoldDurations, different lengths
of the input pulse, and different initial values for the input signal.
</p>
</html>", revisions="<html>
<ul>
<li>
June 14, 2017, by Michael Wetter:<br/>
Added more tests for different initial signals and different hold values.
</li>
<li>
May 24, 2017, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"),
    Diagram(coordinateSystem(extent={{-160,-100},{160,100}})));
end TrueFalseHold;
