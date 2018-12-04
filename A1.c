
#include <stdio.h>
 
int main()
{
   int array[300], n, d, position, swap, ap, ad, ai, i, j;

   printf("Enter number of elements\n");
   scanf("%d", &n);

   j = n-1;

   printf("Enter %d integers\n", n);

   for ( i = 0 ; i < n ; i++ )
      scanf("%d", &array[i]);
 
   for ( i = 0 ; i < j ; i++ ) // line 15
   {
   	LABEL:
      position = i;
 
      for ( d = i + 1 ; d < n ; d++ )
      {
      	ap = array[position];
      	ad = array[d];
         if ( ad < ap )
            position = d;
      }
      if ( position < i ){
      	
      		goto LABEL;
      	
      }
      else
      //else// if positiion == i jmp line 15
      {
      	// ai = array[i];
         //ap = array[position];

         swap = array[i];

         ap = array[position];
         array[i] = ap;

         array[position] = swap;
        
         //array[i] = array[position];


         //array[position] = swap;
      }
   }
 
	printf("Sorted list in ascending order:\n");

   for ( i = 0 ; i < n ; i++ )
      printf("%d\n", array[i]);
 
   return 0;
}