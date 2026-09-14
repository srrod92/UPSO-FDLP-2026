namespace GuiaMatrices
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[,] mapa = CrearMatriz(10, 12);         

            ImprimirMatriz(mapa);

            Tuple<int, int> coordenadas = TomarCoordenadas();

            CambiarTerreno(mapa, coordenadas);

            ImprimirMatriz(mapa);

        }
        static void ImprimirMatriz(int[,] matriz)
        {
            for (int i = 0; i < matriz.GetLength(0); i++)
            {
                Console.Write($"{i}. ");
                for (int j = 0; j < matriz.GetLength(1); j++)
                {
                    Console.Write($"| {matriz[i, j]} |");
                }
                Console.WriteLine();
            }
            Console.WriteLine();

            Console.Write(" ");
            for (int i = 0;i < matriz.GetLength(1); i++)
            {
                Console.Write($"{i,5}");
            }
            Console.WriteLine();
        }

        static int[,] CrearMatriz(int ancho, int alto)
        {
            int[,] mapa = new int[ancho, alto];

            for(int i = 0; i<ancho; i++)
            {
                for (int j =0; j<ancho; j++)
                {
                    mapa[i,j] = Random.Shared.Next(2);
                }
            }

            return mapa;
        }


        static Tuple<int,int> TomarCoordenadas()
        {
            Console.WriteLine("Ingrese coordenada X para modificar: ");
            int coordenadaX = int.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese coordenada Y para modificar: ");
            int coordenadaY = int.Parse(Console.ReadLine());

            return new Tuple<int,int>(coordenadaX, coordenadaY);
        }


        static void CambiarTerreno(int[,] mapa, Tuple<int,int> cambiar)
        {
            mapa[cambiar.Item1, cambiar.Item2] = mapa[cambiar.Item1, cambiar.Item2] == 0 ? 1 : 0;
        }


    }


}
