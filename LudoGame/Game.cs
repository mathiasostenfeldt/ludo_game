using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LudoGame
{
    public enum GameColor { Green, Yellow, Blue, Red };
    public class Game
    {
        private int NumberOfPlayers;
        private List<Player> PlayerList;

        public Game()
        {
            MainMenu();
            StartNewGame();
        }


        public void MainMenu()
        {
            Console.WriteLine("Welcome to Ludo!");

        }

        public void StartNewGame()
        {
            Board board = new Board();
            SetNumberOfPlayers();
            CreatePlayerList(this.NumberOfPlayers);
            ShowPlayers();
            
            
        }
        public void SetNumberOfPlayers()
        {
            Console.Write("How many players? ");
            while (NumberOfPlayers < 2 || NumberOfPlayers > 4)
            {
                if (!Int32.TryParse(Console.ReadLine(), out this.NumberOfPlayers))
                {
                    Console.WriteLine("Wrong input, you can only choose between 2-4");
                }
            }
        }
        public void CreatePlayerList(int numberOfPlayers)
        {
            this.PlayerList = new List<Player>();

            for (int i = 1; i < numberOfPlayers + 1; i++)
            {
                Console.Write("Player {0} name: ", i);
                string name = Console.ReadLine();
                Console.WriteLine("What color do you want {0}?", name);
                Console.Write("1. Green, 2. Yellow, 3. Blue, 4. Red: ");

                int color = 0;

                while (color < 1 || color > 4)
                {
                    if (!Int32.TryParse(Console.ReadLine(), out color))
                    {
                        Console.WriteLine("Not a valid option, try agian...");
                    }
                }
                this.PlayerList.Add(new Player(i, name, (GameColor)(color - 1)));
            }
        }

        public void ShowPlayers()
        {
            foreach (Player plr in this.PlayerList)
            {
                plr.ShowPlayer(plr);
            }
        }
    }
}
