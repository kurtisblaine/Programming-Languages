#include <iostream>

using namespace std;


int main()
{
	// create a jagged array (an array of arrays that could be of different sizes)
	int * A[3];  // an array of pointers to int
	int  a0[2];       
	int  a1[3];       
	int  a2[4];      
	
	
	A[0] = a0;     //  0:   _ _         NAme of an array is a reference to the array
	A[1] = a1;     //  1:   _ _ _
	A[2] = a2;     //  2:   _ _ _ _
	
	               //   0:  _ _
	A[1][0] = 8;   //   1:  8 _ _
	A[2][3] = 99;  //   2:  _ _ _ 99

	
	
    cout << "-------------------------- " << endl;	
	cout << A[1][0] << endl;
	cout << A[2][3] << endl;
	
	
//======================================================================		
	cout << "-------------------------- " << endl;
	
	// is this an array of pointers to arrays of int?
	int M[3][5];
	
	
	M[1][0]= 555;	// is it a pointer that can be derefferenced?
	
	cout << *M[1] << endl;  // YEP
	
    cout << "-------------------------- " << endl;
    
//======================================================================	
	int *p = M[1];  // create a pointer to the 1-D array at M[1]
	
	p[1] = 77;  // can use it just like a 1-D array.
	
	cout << M[1][1] << endl;  // output  77	
	
    cout << "-------------------------- " << endl;
 
 //====================================================================   
	// Pointer artihmetic works with 1-D arrays
	p[0] = 0;
	p[1] = 1;
	p[2] = 2;
	p[3] = 3;	
	p[4] = 4;
	
	for (int i = 0; i < 5; i++) // using pointer arithmetic
	{
		cout << *p << " " ;
		p++;
		
	}
	
	cout << endl;
	
	
    for (int c = 0; c < 5; c++)  // using indexing formula (more overhead)
	   cout << M[1][c] << " " ;
	   
	cout << endl;
	
    cout << "-------------------------- " << endl;
	
//======================================================================		
	// WHY WON"T Pointer Aritmetic work with 2D arrays directly in C++ ?
	
	// If you had a 2D array lets say 15 X 10 of ints how could you traverse is row by row using pointer arithmetic in C++ ?
	
	
    int B[15][10] = {0};
	int * p2; 
	
	for (int r = 0; r < 15; r++)
	{
		p2 = B[r];
		
		for (int c = 0; c < 10; c++)	
		   cout << *p2++ << " ";
		   
		cout << endl;		   
  	}
	
		
	return 0;	
}


