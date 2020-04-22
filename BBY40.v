`include "disciplines.vams"
`include "constants.vams"


// Begin description of BBY40 Diode
module diode(anode,cathode);
  electrical anode, cathode;
  parameter real Area = 1.0 from (0:inf];  // Area scaling factor
  parameter real Is = 10e-15;                // Saturation Current
  parameter real Rs = 1e-3 from [0:inf];    //Series resistance
  parameter real N  = 1.0 from (0:inf);     //Ideality Factor
  parameter real Tt = 0.0 from (0:inf];     //Transit Time
  parameter real Cjo = 58.965513e-12 from (0:inf]; // Junction Capacitance (Zero-Bias)
  parameter real Vj = 2.527983;             //Junction Potential
  parameter real M = 1 from [0:inf];    // Grading Coeff
  parameter real Fc = 500m from [0:1];  // Forward Bias Junction para
  parameter real Kf = 1,                // Flicker Noise Coeff
  real Vd, Id, Qd;
  real f1,f2,f3,Fcp;
    analog begin
      f1 = (Vj/(1-M))*(1-pow((1-Fc),1-M))
      f2 = pow((1-Fc),(1+M))
      f3 = 1-Fc*(1+M);
      Fcp = Fc*Vj;
      Vd = V(anode,cathode);
      //Intrinsic diode
      Id = Area * Is * (exp(Vd / (N * $vt - Rs * I(anode,cathode)) / $vt)))-1)l;
      
    end
