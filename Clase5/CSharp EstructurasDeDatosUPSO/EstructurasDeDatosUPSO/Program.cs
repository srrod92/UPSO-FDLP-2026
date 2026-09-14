using System.Net.Http.Headers;

namespace EstructurasDeDatosUPSO
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Dictionary<string, int> mochila = new Dictionary<string, int>();

            mochila.Add("Espada", 1);
            mochila.Add("Pocion de vida", 2);
            mochila.Add("Escudo", 1);

            ImprimirMochila(mochila);

            UsarItem(mochila, "Escudo");
            UsarItem(mochila, "Pocion de vida");

            ImprimirMochila(mochila);


            string cadena = "Esto es un array";
            char[] cadenaParseada = cadena.ToCharArray();
            cadenaParseada[11] = 'B';
            cadena = new string(cadenaParseada);

            Console.WriteLine(cadena);



            string[,] matriz = new string[10,10];

            for (int x = 0; x < matriz.GetLength(0); x++)
            {
                for (int y = 0; y < matriz.GetLength(1); y++)
                {
                    matriz[x, y] = $"({x},{y})";  // (0,0)  (0,1)  (0,2) ....   (1,0)
                }
            }

            for (int x = 0; x < matriz.GetLength(0); x++)
            {
                for (int y = 0;y < matriz.GetLength(1); y++)
                {                   
                    Console.Write(matriz[x,y]);
                }

                Console.WriteLine();
            }

        }

        static void ImprimirMochila(Dictionary<string, int> mochila)
        {
            Console.WriteLine("Inventario: ");
            foreach (var par in mochila)
            {
                Console.WriteLine($"{par.Key}: {par.Value.ToString()}");
            }
        }

        static void UsarItem(Dictionary<string, int> mochila, string item)
        {

            if (mochila.ContainsKey(item))
            {
                Console.WriteLine($"Usando un {item}");
                
                Console.WriteLine($"{item} restantes: {--mochila[item]}");

                if (mochila[item] <= 0)
                {
                    mochila.Remove(item);
                }
            }
        }

    }
}
