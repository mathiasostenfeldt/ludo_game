using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LudoGame
{
    public class Board
    {

        public static List<Field> CompBoard { get; set; }
        public List<Token> Tokens { get; }

        public Board()
        {
            GenerateBoard();
        }

        public List<Field> GetBoard()
        {
            foreach (Field field in CompBoard)
            {
                Console.WriteLine(field.Id + " " + field.Type + " " + field.Color);
            }
            return CompBoard;
        }


        static void GenerateBoard()
        {

            
            Field field;
            List<Field> fields = new List<Field>();

            for (int y = 0; y < 4; y++)
            {
                for (int i = 0; i < 23; i++)
                {
                    if (i == 0)
                    {
                        field = new Field(i, FieldType.Finish, (GameColor)y);
                        fields.Add(field);
                    }
                    else if (i <= 5)
                    {
                        field = new Field(i, FieldType.Safe, (GameColor)y);
                        fields.Add(field);
                    }
                    else if (i <= 7 || i > 12)
                    {
                        field = new Field(i, FieldType.InPlay, (GameColor)y);
                        fields.Add(field);
                    }
                    else if (i <= 11 )
                    {
                        field = new Field(i, FieldType.Home, (GameColor)y);
                        fields.Add(field);
                    }
                    else if (i <= 12)
                    {
                        field = new Field(i, FieldType.Start, (GameColor)y);
                        fields.Add(field);
                    }
                }
            }

            CompBoard = fields;
        }
    }
}
