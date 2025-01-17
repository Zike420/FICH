#include <iostream>
#include <cmath>
using namespace std;

int main() {
	
	cout << 2 << endl;
	
	int n;
	int c;
	c=1;
	n=3;
	
	do{
		bool primo = true;
		for(int d=2; d<=(n/2); ++d) {
			if (n%d==0){
				primo = false;
				break;
			}
			
			
			
		}
		if (primo) {
			cout << n << endl;
			++c;
		}
		
		n += 2;
	} while(n<1000);
	
	return 0;
}

