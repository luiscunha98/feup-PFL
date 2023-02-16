import Data.List
import Data.String
--import Test.QuickCheck ( (==>), withMaxSuccess, quickCheck, Property )

type Poly = (Int, String ,Int)
type ListOfPoly = [Poly]


type SpecPoly = (Int,[(String,Int)])-- melhorar : Represent everything with strings so we cover : coef = 1020304 and exp = 1012021 or - 10901290  etc -> onde ouver operações usar read and show para efetuar operações e guardar de novo como string
type ListOfSpecPoly = [SpecPoly]

-- Function to change the list of tuples for the exponent of the variables in the polynomial
-- Input: List of tuples
-- Output: List of tuples with the exponent of the variables and the variables
-- Example: 2*x^2y^2 = (2,[(x,2),(y,2)]) -> 
-- derivate SpecPoly = (2,[(x,1),(y,1)])
--p1:: (2,[("x",2),("y",2),("z",3),("t",4)]) 


-- function to add SpecPoly
-- Input: 2 SpecPoly
-- Output: SpecPoly with the sum of the coefficients and the variables
-- Example: (2,[("x",2),("y",2)]) + (3,[("x",2),("y",2)]) = (5,[("x",2),("y",2)])
--p2:: (2,[("x",2),("y",2)]) + (3,[("x",2),("y",2)]) = (5,[("x",2),("y",2)])

addSpecPoly :: SpecPoly -> SpecPoly -> ListOfSpecPoly
-- base cases
addSpecPoly (a,[]) (b,[]) = [(a+b,[])]
addSpecPoly (a,[]) (b,ys) = [(b,ys)] ++ [(a,[])]
addSpecPoly (a,xs) (b,[]) = [(a,xs)] ++ [(b,[])]
addSpecPoly (a,(var1,exp1):xs) (b,(var2,exp2):ys)
    | compareList ((var1,exp1):xs) ((var2,exp2):ys) == True = [(a+b,(var1,exp1):xs) ]
        | otherwise = [(a,(var1,exp1):xs)] ++ [(b,(var2,exp2):ys)]
    
-- addListOfSpecPoly :: ListOfSpecPoly -> ListOfSpecPoly -> ListOfSpecPoly
-- addListOfSpecPoly [] [] = []
-- addListOfSpecPoly [] ys = ys
-- addListOfSpecPoly xs [] = xs
-- addListOfSpecPoly ((coef1,[var1:vars1]):xs) ((coef2,[var2:vars2]):ys) = addSpecPoly ((coef1,[var1:vars1])) ((coef2,[var2:vars2])) : addListOfSpecPoly xs ys

    --[(a+b, xs ++ ys)]

 -- compare list SpecPoly


multiplicationSpecPoly :: SpecPoly -> SpecPoly -> SpecPoly
multiplicationSpecPoly (a,[]) (b,[]) = (a*b,[])
multiplicationSpecPoly (a,[]) (b,ys) = (a*b,ys)
multiplicationSpecPoly (a,xs) (b,[]) = (a*b,xs)
multiplicationSpecPoly (a,(var1,exp1):xs) (b,(var2,exp2):ys) = (a*b, multChangeExp((var1,exp1):xs) ((var2,exp2):ys))

-- function to multiply List of SpecPoly
multListOfSpecPoly:: ListOfSpecPoly -> ListOfSpecPoly -> ListOfSpecPoly
multListOfSpecPoly [] [] = []
multListOfSpecPoly [] ys = ys
multListOfSpecPoly xs [] = xs
multListOfSpecPoly ((coef1,vars1):xs) ((coef2,vars2):ys) = normalize (multiplicationSpecPoly ((coef1,vars1)) ((coef2,vars2)) : multListOfSpecPoly xs ys )



-- function to get the variables and possible new exponents of the SpecPoly from multiplication of two SpecPoly
multChangeExp ::[(String,Int)] -> [(String,Int)] -> [(String,Int)]
multChangeExp [] [] = []
multChangeExp [] ys = ys
multChangeExp xs [] = xs
multChangeExp ((var1,exp1):xs) ((var2,exp2):ys)
   -- | --var1 == var2 && exp == 1 = []
    | var1 /= var2 = (var1,exp1) : multChangeExp xs ((var2,exp2):ys)
    | otherwise = (var1,exp1+exp2) : multChangeExp xs ys


-- funtion to using compareSpecPolyAndAddToList to normalize the list of SpecPoly
-- Input: SpecPoly and ListOfSpecPoly
-- Output: ListOfSpecPoly with the SpecPoly added to the list
-- Example: (2,[("x",2),("y",2)]) and [(3,[("x",2),("y",2)]),(0,[("x",2),("y",2)])] = [(5,[("x",2),("y",2)])]


normalize :: ListOfSpecPoly -> ListOfSpecPoly
normalize [] = []
normalize ((0,_):xs) = normalize xs
normalize (x:xs) = compareSpecPolyAndAddToList x (normalize xs) 




   
compareSpecPolyAndAddToList :: SpecPoly -> ListOfSpecPoly -> ListOfSpecPoly
compareSpecPolyAndAddToList (coef,vars) [] = [(coef,vars)]
compareSpecPolyAndAddToList (0,[]) xs = xs
compareSpecPolyAndAddToList (coef,vars) ((coef2,vars2):xs)

    | compareSpecPolyToAdd (coef,vars) ((coef2,vars2)) == True = (coef+coef2,vars2) :xs
    | otherwise = compareSpecPolyAndAddToList (coef,vars) xs ++ [(coef2,vars2)]






somaListOfSpecPoly :: ListOfSpecPoly -> ListOfSpecPoly -> ListOfSpecPoly
somaListOfSpecPoly [] []= []
somaListOfSpecPoly [] ys = ys
somaListOfSpecPoly xs [] = xs
somaListOfSpecPoly xs ys = normalize (normalize xs ++ normalize ys)





-- trynorm :: ListOfSpecPoly -> ListOfSpecPoly
-- trynorm [] = []
-- trynorm ((coef1,vars1):xs) = compareSpecPolyAndAddToList ((coef1, vars1):result) 
--      where result = compareSpecPolyAndAddToList ((coef1,vars1) xs )

derivateSpecPoly ::String -> SpecPoly -> SpecPoly-- it means zero when the list is empty
derivateSpecPoly var (c,[]) = (0,[])
derivateSpecPoly var (coef,((var1,exp):xs)) 
    | foundVar var (coef,((var1,exp):xs)) == True =  (dervChangeCoef var (coef,((var1,exp):xs)), dervChangeExp var (coef,((var1,exp):xs))) -- if the variable exists on the polinomial , then the exponent is reduced by 1

    | otherwise = (0, []) -- if the variable used to derivate is not in the Specpolynomial, then the result is zero by derivation rules -> zero 
dervListOfSpecPoly :: String -> ListOfSpecPoly -> ListOfSpecPoly
dervListOfSpecPoly var [] = []
dervListOfSpecPoly var (x:xs) = [derivateSpecPoly var x] ++ dervListOfSpecPoly var xs

-- Function to change the exponent of the variable used to derivate
-- change the list of the tuples of the polynomial
-- Input: variable used to derivate, var and list of tuples of the polynomial
-- Output: list of tuples of the polynomial with the new exponent of the variable used to derivate and coeficient
-- Example: dervChangeExp x 2*x^2y^2 = (2,[(x,2),(y,2)]) ->  (4,[(x,1),(y,2)]) = 4*x*y^2
dervChangeExp :: String -> SpecPoly -> [(String,Int)]
dervChangeExp var (coef,(var1,exp):xs) 
--dervChangeExp var [] = []
    | var == var1 && exp == 1 = [] -- if the exponent is 1, then we just stay with the coeficient -> polinomial of degree 0
    | var /= var1 = (var1,exp):dervChangeExp var (coef,xs )
    | var == var1 = (var1,exp-1):xs
    | otherwise = []

 -- Compare two[(String,Int)] and return True if they are equal
    -- Input: 2 [(String,Int)]
    -- Output: True if they are equal, False if they are not equal
    -- Example: compareList [("x",2),("y",2)] [("x",2),("y",2)] = True
    -- Example: compareList [("x",2),("y",2)] [("x",2),("y",3)] = False
    -- Special compareList to use in derivateSpecPoly
compareList :: [(String,Int)] -> [(String,Int)] -> Bool
compareList [] [] = True
compareList [] ys = True
compareList xs [] = False
compareList ((var1,exp1):xs) ((var2,exp2):ys)
    | var1 == var2 && exp1 == exp2 = compareList xs ((var2,exp2):ys) -- when xs turns empty, it means that the list1 is equal to list 2
    | otherwise  = compareList ((var1,exp1):xs) ys


compareSpecPolyToAdd:: SpecPoly -> SpecPoly -> Bool
compareSpecPolyToAdd (coef,[]) (coef2,[]) = True
compareSpecPolyToAdd (coef,[]) (coef2,ys) = False
compareSpecPolyToAdd (coef,xs) (coef2,[]) = False
compareSpecPolyToAdd (coef,(var1,exp1):xs) (coef2,(var2,exp2):ys)
    | var1 == var2 && exp1 == exp2 = compareSpecPolyToAdd (coef,xs) (coef2,ys)
    | otherwise = False


compareSpecPolyToSum :: SpecPoly -> SpecPoly -> Bool
compareSpecPolyToSum (a,[]) (b,[]) = True
compareSpecPolyToSum (a,[]) (b,ys) = False
compareSpecPolyToSum (a,xs) (b,[]) = False
compareSpecPolyToSum (a,(var1,exp1):xs) (b,(var2,exp2):ys)
    | var1 == var2 && exp1 == exp2 = compareSpecPolyToSum (a,xs) (b,ys)
    | otherwise = False


-- compareListOfSpecPolyToSum :: ListOfSpecPoly -> ListOfSpecPoly -> Bool
-- compareListOfSpecPolyToSum [] [] = True
-- compareListOfSpecPolyToSum [] ys = False
-- compareListOfSpecPolyToSum xs [] = False
-- compareListOfSpecPolyToSum ((coef1,vars1):xs) ((coef2,vars2):ys)
--     | compareSpecPolyToSum (coef1,vars1) (coef2,vars2) == True = compareListOfSpecPolyToSum xs ys
--     | otherwise = False
    
foundVar :: String -> SpecPoly -> Bool
foundVar var (coef,[]) = False
foundVar var (coef,((var1, exp):xs))
    | var == var1 && exp /= 1 && exp /= 0 = True
    | var == var1 && exp == 1 = True
    | otherwise = foundVar var (coef,xs)

dervChangeCoef:: String -> SpecPoly -> Int
dervChangeCoef var (coef,[]) = 0
dervChangeCoef var (coef,((var1,exp):xs))
    | var == var1 = coef * exp
    | var == var1 && exp == 1 = coef
    | otherwise = dervChangeCoef var (coef,xs)



-- tests for the function derivateSpecPoly
-- test 1: derivateSpecPoly x (2,[("x",2),("y",2),("z",3),("t",4)]) = (4,[(x,1),(y,2),("z",3),("t",4)])
--testDerivateSpecPoly1 :: SpecPoly -> Property
testDerivateSpecPoly1 = derivateSpecPoly "x" (2,[("x",2),("y",2),("z",3),("t",4)]) == (4,[("x",1),("y",2),("z",3),("t",4)])


--derivateSpecPoly x (coef, var, list) = -- (coef, var, -- mudar potencia da variavel ou tirar variavel da lista e da String do SpecPoly -> A terminar ) 




specPolytoString:: SpecPoly -> String
specPolytoString (coef, x:xs) = show coef ++ "*" ++ listOfTuplesToString (x:xs)
specPolytoString (coef, []) = show coef

-- TupleToString:: (String,Int) -> String
-- TupleToString [] = ""
-- TupleToString (x,y) = x ++ "^" ++ y 


listOfTuplesToString :: [(String,Int)]-> String 
listOfTuplesToString [] = ""
listOfTuplesToString ((var,exp):xs) = var ++ "^" ++ show exp ++ listOfTuplesToString xs

-- function to convert a list of SpecPoly to a String
-- Input: list of SpecPoly
-- Output: String with the list of SpecPoly in the format of a polynomial eg: 2*x^2y^2 + 3*x^2y^2 or 2*x^2 + 3*y^2 ... 
listOfSpecPolyToString :: ListOfSpecPoly -> String
listOfSpecPolyToString [] = ""
listOfSpecPolyToString ((coef,[]):xs) = show coef ++ "+" ++listOfSpecPolyToString xs
listOfSpecPolyToString ((coef,(var,exp):ys):xs) 
    | xs /= [] = show coef ++ "*" ++ listOfTuplesToString((var,exp):ys) ++ "+" ++ listOfSpecPolyToString xs
    | otherwise = show coef ++"*" ++ listOfTuplesToString((var,exp):ys) 

-- Can we use Regex modules to convert a String to a SpecPoly? and then to a ListOfSpecPoly?
-- Perguntar ao professor a melhor abordagem para o input de string ?!?!

-- -- Function to convert a string to a SpecPoly
-- -- Input: String
-- -- Output: SpecPoly
-- -- Example: stringToSpecPoly "2*x^2y^2" = (2,[("x",2),("y",2)])
-- stringToSpecPoly :: String -> SpecPoly
-- stringToSpecPoly [] = error "empty string"
-- stringToSpecPoly (x:xs) 
--     | x == '+' = stringToSpecPoly xs
--     | x == '-' = stringToSpecPoly xs
--     | x == '*' = stringToSpecPoly xs
--     | x == ' ' = stringToSpecPoly xs
--     | otherwise = (read [x] :: Int, stringToSpecPolyTuples xs) --we get the coeficient of the SpecPoly and now we need  to save the pairs of the variables and the exponents of SpecPoly

-- -- Funtion to convert a string to a list of tuples
-- -- Input: String
-- -- Output: [(String,Int)]
-- -- Example: stringToSpecPolyTuples "x^2y^2" = [("x",2),("y",2)]
-- stringToSpecPolyTuples :: String -> [(String,Int)]
-- stringToSpecPolyTuples [] = []
-- stringToSpecPolyTuples (x:xs) 
--     | x == '+' = error "invalid format"
--     | x == '-' = stringToSpecPolyTuples xs
--     | x == '*' = stringToSpecPolyTuples xs
--     | x == ' ' = stringToSpecPolyTuples xs
--     | x == '^' = stringToSpecPolyTuples xs
--     | x =~ "[a-z]+" || x =~ "[A-Z]+" = (read [x] :: String, stringToSpecPolyTuplesExp xs) --we get the variable of the SpecPoly and now we need  to save the exponent of the variable

-- -- Funtion to convert a string to a Int
-- -- Input: String
-- -- Output: Int
-- -- Example: stringToSpecPolyTuplesExp "2y^2" = 2
-- stringToSpecPolyTuplesExp :: String -> Int
-- stringToSpecPolyTuplesExp [] = error "invalid format"
-- stringToSpecPolyTuplesExp (x:y:xs) 
--     | x == '+' = error "invalid format"
--     | x == '-' = error "invalid format"
--     | x == '*' = error "invalid format"
--     | x == ' ' = error "invalid format"
--     | x == '^' = stringToSpecPolyTuplesExp xs
--      x =~ "[0-9]+" && y =~ "[0-9]+" = read [x] :: Int
--     | x =~ "[0-9]+" &&  not y =~ "[0-9]+"  = read [x] :: Int --we get the exponent of the variable and now we need  to save the variable and the exponent of the SpecPoly


-- 

-- -- Function to convert a string to a list of polynomials
-- stringToListOfPoly :: String -> ListOfPoly
-- stringToListOfPoly s = map stringToPoly (words s)

-- -- Function to add two polynomials
-- addPoly :: Poly -> Poly -> Poly
-- addPoly (c1, x, n1) (c2, _, n2) | n1 == n2 = (c1 + c2, x, n1)
--                                 | otherwise = error "Polynomials must have the same degree"

-- -- function to add two lists of polynomials
-- addListOfPoly :: ListOfPoly -> ListOfPoly -> ListOfPoly
-- addListOfPoly [] [] = []
-- addListOfPoly [] ps = ps
-- addListOfPoly ps [] = ps
-- addListOfPoly (p:ps) (q:qs) = addPoly p q : addListOfPoly ps qs





-- pol1:: ListOfPoly
-- pol1 = [(2,"y",3),(1,"x",3),(1,"x",3),(1,"x",3),(1,"x",3),(1,"x",2),(1,"x",1)];

-- {-Função para verificar Polinomios , verifica se a incognita e o grau são os mesmos, se sim retorna True-}

-- verificar :: Poly -> Poly -> Bool
-- verificar (a,b,c) (d,e,f)
--     | b == e && c == f  = True   
--     | otherwise = False

-- {-Função para Somar Polinomios-}

-- somar :: Poly -> Poly -> Poly
-- somar (a,b,c) (d,e,f)
--     | (verificar (a,b,c) (d,e,f) == True) = (a + d,e,f)


-- {-Função para multiplicar Polinomios-}

-- multiplicar :: Poly -> Poly -> Poly
-- multiplicar (a,b,c) (d,e,f)
--     | (verificar (a,b,c) (d,e,f) == True) = (a*d,e,f)


-- {-Função para derivar Polinomios-}

-- derivada :: Poly -> Poly
-- derivada (a,b,c) 
--     | c>= 1 = (a*c, b, c-1)
--     | otherwise = (0,b,0) 


--  {--Função derivada mais geral --}   

-- derivadaSpec ::String -> Poly -> Poly
-- derivadaSpec x (a,b,c)
--     | ( x == b && c /= 0 ) = (a*c, b, c-1)
--     | ( x == b && c == 0) = (0,b,0) 
--     -- for this cases we need to evaluate all the variables from the string and return a polinomial
--     | length b > 1 && verifyVar x b && c >=2 = (a*c, b, c-1)  -- case of more than one variable -- case of more than one variable use derivateSpecPoly
--     | length b > 1 && verifyVar x b && c == 1 = (a, deleteVar x b, 0)   -- case of more than one variable -- case of more than one variable use derivateSpecPoly

-- {-Função para normalizar Polinomios-}

-- normalizar :: ListOfPoly -> ListOfPoly
-- normalizar [] = []
-- normalizar ((0,_,_):xs) = normalizar xs
-- normalizar (x:[]) = [x]
-- normalizar (x:y:xs) =
--     if (verificar x y == True)
--         then normalizar ((somar x y):xs)
--         else x:(normalizar (y:xs))

-- --deleteZero:: ListOfPoly -> ListOfPoly
-- --deleteZero xs = [ x | x <-xs, sel1 x /= 0  ]

-- {--
-- normalizePolyList :: ListOfPoly -> ListofPoly
-- normalizePolyList (x:xs) = newPolyList :
-- --}

-- verifyVar :: String-> String -> Bool
-- verifyVar x []  = False
-- verifyVar (x:xs) (y:ys)
--     | x /= y = verifyVar x ys
--     | otherwise = True

-- deleteVar :: String -> String -> String
-- deleteVar x [] = []
-- deleteVar x (y:ys)
--     | x == y = deleteVar x ys
--     | otherwise = y:(deleteVar x ys)