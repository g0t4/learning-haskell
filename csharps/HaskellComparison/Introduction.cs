namespace HaskellComparison
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using NUnit.Framework;

    [TestFixture]
    public class Introduction : AssertionHelper
    {
        [Test]
        public void quicksort_withitems_sorts()
        {
            var items = new[] {1, 5, 8, 3, 8, 6, 5, 3, 9};

            var sorted = quicksort(items);

            Expect(sorted, Is.EquivalentTo(new[] {1, 3, 3, 5, 5, 6, 8, 8, 9}));
        }

        [Test]
        public void quicksort_withemptylist_returnsemptylist()
        {
            var emptyList = Enumerable.Empty<int>();

            var sorted = quicksort(emptyList);

            Expect(sorted, Is.EquivalentTo(emptyList));
        }

        private IEnumerable<T> quicksort<T>(IEnumerable<T> items)
            where T : IComparable<T>
        {
            if (!items.Any()) return items;
            var pivot = items.First();
            var remainder = items.Skip(1);
            var lesser = quicksort(remainder.Where(i => i.CompareTo(pivot) < 0));
            var greater = quicksort(remainder.Where(i => i.CompareTo(pivot) >= 0));
            return lesser.Concat(new[] {pivot}).Concat(greater);
        }
    }
}