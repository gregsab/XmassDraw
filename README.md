##XmassDraw
Jest to programik, który losuje, kto komu będzie kupował prezent pod choinkę. Aby wszystko było poprawne, muszą być spełnione następujące warunki:
  - nie kupujemy prezentów sobie.
  - nie kupujemy prezentu mężowi/żonie *)

*) To znaczy kupujemy męzowi/żonie ale zupełnie niezależnie od tego losowania.

###Zadanie
Przypisać każdej osobie inna osobę, tak by nie był to jej małżonek lub małżonka.

###Rozwiązanie
Układamy osoby w ciąg, tak aby najpierw byli wylistowani mężowie, a następnie w tej samej kolejności żony.
Permutujemy ciąg do momentu, aż nie zostaną spełnione warunki poprawności rozwiązania.

Przykładowy wynik losowania:

```
> source("xdraw.R")
       kto     komu
1   Henryk Grzegorz
2      Jan   Agatka
3 Grzegorz   Henryk
4    Marek      Ela
5 Apolonia     Ania
6      Ela    Marek
7   Agatka      Jan
8     Ania Apolonia
```

To samo w formie wykresu:

![wynik 20XX](https://github.com/gregsab/XmassDraw/blob/master/20XX.png)
