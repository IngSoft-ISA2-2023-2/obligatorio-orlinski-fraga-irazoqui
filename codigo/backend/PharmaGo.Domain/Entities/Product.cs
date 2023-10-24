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
        public decimal Price { get; set; }
        public bool Deleted { get; set; }
        public int Stock { get; set; } = 0;
        public Pharmacy? Pharmacy { get; set; }

        public void ValidOrFail()
        {
            if (string.IsNullOrEmpty(Code))
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            if (Code.Length != 5)
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            if (!IsDigitsOnly(Code))
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            if (string.IsNullOrEmpty(Name))
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            if (!IsAlphanumeric(Name, 30))
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            if (string.IsNullOrEmpty(Description))
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            if (!IsAlphanumeric(Description, 70))
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            if (Price <= 0)
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            if (Pharmacy == null)
            {
                throw new InvalidResourceException("The Product is not correctly created.");
            }
            //if (string.IsNullOrEmpty(Code) || Code.Length != 5 || Code.All(char.IsDigit) ||
            //    string.IsNullOrEmpty(Name) || IsAlphanumeric(Name, 30) ||
            //    string.IsNullOrEmpty(Description) || IsAlphanumeric(Description, 70) ||
            //    Price <= 0 || Pharmacy == null)
            //{
            //    throw new InvalidResourceException("The Product is not correctly created.");
            //}
        }

        private bool IsAlphanumeric(string str, int maxLength)
        {
            //string pattern = $@"^[\p{{L}}\p{{N}}.-\s]{{1,{maxLength}}}\z(?<=[\p{{L}}\p{{N}}])";
            string pattern = $@"^[a-zA-Z0-9 áéíóú]{{1,{maxLength}}}$";
            return new Regex(pattern).IsMatch(str);
        }

        private bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if (c < '0' || c > '9')
                    return false;
            }

            return true;
        }
    }
}
