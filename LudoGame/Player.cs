using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LudoGame
{
    class Player
    {
        
        public string Name { get; }
        public GameColor Color { get; }
        public int Pid { get; }

        public Player(int pid, string name, GameColor clr)
        {
            Pid = pid;
            Name = name;
            Color = clr;

        }

        public Player(int numberOfPlayers)
        {

        }

        public void ShowPlayer(Player plr)
        {
            Console.WriteLine("Player {0} name is: {1}, and has the color: {2}.", plr.Pid, plr.Name, plr.Color);
        }
    }
}
