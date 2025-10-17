#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [ECE592-116 Lab 2: Radar Cross Section],
  authors: (
    (
      name: "John Kesler",
      email: "jckesle2@ncsu.edu"
    ),
  ),
  figure-supplement: [Fig.],
)

= Theory <sec:theory>
== Reflector RCS <sec:rcs1>

Ultimately, we want to calculate the ratio of RCS between the two reflector types.
First, we can calculate the RCS of the trihedral reflectors, using the formulas from Lecture 6:

$ sigma_("tri") = (4 pi a^4)/(3 lambda^2) $ <eq:rcs_trihedral>

For a given $a$ as the "depth" of the trihedral reflector.
The side lengths of the reflectors were measured, which can be normalized to the correct value via $a=L/sqrt(2)$.

The RCS of the cuboid reflector is a bit harder to model, as the physical object is actually 8 square trihedral reflectors arranged in a cube.
In this case, the RCS was modeled as 4 times the RCS of a single reflector at a max reflective angle (overall RCS x 0.5), as the reflector was oriented broadside when taking measurements.

$ sigma_("cube") = 4 (12 pi L^4)/(2 lambda^2) $ <eq:rcs_cube>

This produces RCS values for each target of:

$ sigma_("tri,small") = 5 [m^2] $
$ sigma_("tri,big") = 52 [m^2] $
$ sigma_("cube") = 1626 [m^2] $

And an overall RCS ratio $K$ of:

$ K = sigma_("cube")/sigma_("tri,big") = 31.5 $

== Establishing Max Clutter Power

From the provided equations

$ K_("true") = P_("cube") / P_("tri,big") $

$ K_("measured") = (P_("cube") + P_("c"))/(P_("tri,big") + P_("c")) $

$ %_("err") = (K_("true") - K_("measured")) / K_("true") $

we can rearrange them to express % error in terms of $P_("c")/P_("tri,big")$, assuming the value of $K$ calculated in part @sec:rcs1 as the true value. The reciprocal of this gives an SCR ratio to meet a certain %err requirement.

$ P_("c")/P_("tri,big") = (0.1 K) / (0.9 K - 1) = 0.115 $

in 10log dB the $P_("c")/P_("tri,big")$ ratio is:

$ P_("c")/P_("tri,big") = -9.39 ["dB"] $

The needed SCR (signal-clutter ratio) for this given K is conversely 9.39dB.

Note that the ratio is roughly asymptotic with respect to K, implying that a) the closer in RCS two targets are to each other, the less clutter power can be tolerated, and b) the limit for large Ks is roughly 1/9 = 0.111, implying that the _smaller of the two measurements should always be at least about 10dB over the clutter_ (to meet the 10% error requirement).

= Experiments
== Background Clutter Power

All recordings taken for this lab were done with the following settings:

#figure(
  caption: [Infineon GUI Parameters],
  table(
    columns: (auto, auto),
    stroke: (x, y) => if y <= 1 { (top: 0.5pt) },
    fill: (x, y) => if y > 0 and calc.rem(y, 2) == 0 { rgb("#efefef") },
    table.header(
      [Parameter], [Value]
    ),

    [Samples per Chirp], [73],
    [Chirps per Frame], [64],
    [Sample Rate], [2 [MHz]],
    [Start Freq], [59.614 [GHz]],
    [End Freq], [61.886 [GHz]],
    [Tx Power "level"], [31],
    [IF Gain], [23 [dB]],
    [Frame Repitition Time], [77.26885 [ms]],
  )
) <tab:settings>

These settings gave a rough theoretical range of approx 2m, with a speed resolution of approx 0.05 m/s.


