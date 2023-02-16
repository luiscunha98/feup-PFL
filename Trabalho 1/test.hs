import Test.QuickCheck
    ( (==>), withMaxSuccess, quickCheck, Property )

import Poly
    ( addSpecPoly,
      multiplicationSpecPoly,
      derivateSpecPoly,
      Poly(Neg, Zero, Pos) )   