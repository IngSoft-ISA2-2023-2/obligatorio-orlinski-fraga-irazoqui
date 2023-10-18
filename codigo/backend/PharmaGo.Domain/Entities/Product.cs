using PharmaGo.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace PharmaGo.Domain.Entities
{
    public class Product
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float Price { get; set; }
        public Pharmacy? Pharmacy { get; set; }

        public void ValidOrFail()
        {
            if (string.IsNullOrEmpty(Code) || Code.Length != 5 || Code.All(char.IsDigit) ||
                string.IsNullOrEmpty(Name) || IsAlphanumeric(Name, 30) ||
                string.IsNullOrEmpty(Description) || IsAlphanumeric(Description, 70) ||
                Price <= 0 || Pharmacy == null)
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
        }

        private bool IsAlphanumeric(string str, int maxLength)
        {
            string pattern = $@"^[A-Za-z][A-Za-z0-9.-]{{1,{maxLength}}}\z(?<=[A-Za-z0-9])";
            return new Regex(pattern).IsMatch(str);
        }
    }
}
