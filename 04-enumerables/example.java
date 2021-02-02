/*
lista de numeros menores que 100, esa lista multiplique x 3, les sume 1 y que le genere una nueva lista, pero la lista resultante solo debe tener multiplos de 2
*/
    static int[] myArray = {1, 2, 2, 4, 5, 6, 7, 8, 8, 8};

    public static List<Integer> main2(String args[]) {
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < myArray.length; i++) {
            int prod = (myArray[i] * 3) + 1;
            if (prod % 2 == 0) {
                result.add(prod);
            }
        }
        return result;
    }