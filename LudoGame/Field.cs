using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace LudoGame
{
    public enum FieldType { Start, Safe, InPlay, Home, Finish };
    public class Field
    {
        public int Id { get; }
        public GameColor Color { get; }
        public FieldType Type { get; }
        public List<Token> PlacedTokens { get; set; }



        public Field(int id, FieldType typ, GameColor col )
        {
            this.Id = id;
            this.Type = typ;
            this.Color = col;
        }


        public bool PlaceToken(Token tkn)
        {
            if (PlacedTokens.Count() == 1)
            {
                if (true)
                {
                    return true;
                }
                else
                {
                    //return false;
                }
            }
            else if (PlacedTokens.Count() == 2)
            {
                return false;
            }
            else
            {
                PlacedTokens.Add(tkn);
                return true;
            }
            
        }



    }


}
