namespace HaskellComparison
{
    using System;
    using System.Linq;
    using NUnit.Framework;

    public class TriangleProblem
    {
        [Test]
        public void FindTrianglesWithPerimeter24AndEachSideAnIntegerLessThan10()
        {
            // as one line: var results = from a in Enumerable.Range(1, 10) from b in Enumerable.Range(1, 10) from c in Enumerable.Range(1, 10) where (a + b + c == 24) && ((a*a + b*b) == c*c) select new {a, b, c};

            // but more readable IMO
            var results = from a in Enumerable.Range(1, 10)
                          from b in Enumerable.Range(1, 10)
                          from c in Enumerable.Range(1, 10)
                          where (a + b + c == 24) && ((a*a + b*b) == c*c)
                          select new {a, b, c};

            results.ToList().ForEach(Console.WriteLine);
        }
    }
}