using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LudoGame
{
    public class Token
    {
        public GameColor Color { get; }
        public int Id { get; }
        public Field CurrentField { get; set; }

        public Token(GameColor clr, int id)
        {
            this.Color = clr;
            this.Id = id;
        }

        public void AsssignField(Field curfie)
        {
            this.CurrentField = curfie;
        }
    }
}
