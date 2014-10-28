import Text.Printf

main :: IO ()
main = do
  printf "%.6f\n" (cut(1,1,1,1))
  printf "%.6f\n" (fun(1,1,1,1))

fun ::(Double,Double,Double,Double) -> Double
fun (0,0,0,1) = 0
fun (0,0,1,0) = fun (0,0,0,1) + 1
fun (0,1,0,0) = fun (0,0,1,1) + 1
fun (1,0,0,0) = fun (0,1,1,1) + 1
fun (a,b,c,d) =
    (a2 + a3 + a4 + a5) / (a + b + c + d)
    where
    a2 | a > 0 = a * fun (a-1,b+1,c+1,d+1)
          | otherwise = 0
    a3 | b > 0 = b * fun (a,b-1,c+1,d+1)
          | otherwise = 0
    a4 | c > 0 = c * fun (a,b,c-1,d+1)
          | otherwise = 0
    a5 | d > 0 = d * fun (a,b,c,d-1)
          | otherwise = 0

cut :: (Float,Float,Float,Float) -> Float
cut(0,0,0,1)     = 0
cut(a2,a3,a4,a5) = (s2+s3+s4+s5 + single) / sum [a2,a3,a4,a5]
  where
    single | sum [a2,a3,a4,a5] == 1 = 1
           | otherwise = 0
    s2     | a2 > 0 = a2 * cut(a2-1,a3+1,a4+1,a5+1)
           | otherwise = 0
    s3     | a3 > 0 = a3 * cut(a2  ,a3-1,a4+1,a5+1)
           | otherwise = 0
    s4     | a4 > 0 = a4 * cut(a2  ,a3  ,a4-1,a5+1)
           | otherwise = 0
    s5     | a5 > 0 = a5 * cut(a2  ,a3  ,a4  ,a5-1)
           | otherwise = 0
