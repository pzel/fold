fun id x = x;
fun $ (x,f) = f x

val foldTests = [
  It "can implement variadic sum (dyadic)" (
    fn _ => let val op == = Assert.eq Int.toString
                val sum = Fold.fold (0, id)
                val add = fn n => Fold.step0 (fn x => x + n)
                val result = sum (add 1) (add 2) $
            in result == 3
            end)
 ,It "can implement variadic sum (triadic)" (
    fn _ => let val op == = Assert.eq Int.toString
                val sum = Fold.fold (0, id)
                val add = fn n => Fold.step0 (fn x => x + n)
                val result = sum (add 1) (add 2) (add 3) $
            in result == 6
            end)
 ,It "can implement alternative list literals" (
    fn _=> let val op ==  = Assert.eq (concat o List.map Int.toString)
               val list = Fold.fold ([], rev)
               val ` = fn z => Fold.step1 (op::) z
               val result = list `1 `2 `3 $
           in result == [1,2,3]
           end)
]

fun main () =
    runTestsWith foldTests (CommandLine.arguments ())
