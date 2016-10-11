
#include <iostream>
#include <stdlib.h>     /* atof */
#include <math.h> /* pow */


using namespace std;

double charToDouble(char arr[])
{
	
	int size = sizeof((arr))/sizeof((arr[0]));
	
	double result; 

	int intarray[size];

	int period;

	bool hasDecimal = true;

	//Iterate through, find period
	for( int i = 0 ; i < size ; i++ )
	{

		if( arr[i] == '.' )
		{

			period = i;

		} else if ( i = size ) {
		
			//when the double is actually an int

			hasDecimal = false;

		}  else {
				
			//takes a char, converts it to integer
			intarray[i] = arr[i]; 

		}				

	}


	

	// the counter will loop from the highest power ( period  )

	/*

		354.19; period = 3

		= 3( 10^period ) + 5( 10^(period - 1)) + 4( 10^(period - 2)) 

		
		= 3( 10^3 ) + 5( 10^ 2)) + 4( 10^1 ) 

	*/

	for( int i = period ; i > 0 ; i-- )
	{

		result += intarray[i] * ( pow(10, i) );			
						

	}

	return result;

}


int main(int argc, char* argv[])
{

	double first, second;

	first = charToDouble(argv[0]);
	second = charToDouble(argv[1]);

	if(first < second)
	{
		cout << 0;
	} else {

		cout << 1;	

	}

}
