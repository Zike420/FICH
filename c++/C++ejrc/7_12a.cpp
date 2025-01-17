#include <iostream>
#include <cmath>
using namespace std;

int main() {
	
	int n, c, d; 
	c=0;
	cin >> n;
	
	for(d=2 ; d<=(n/2);++d) {
		if (n%d==0) {
			++c;
		}
	}
	

	if (c==0) {
		cout << "Es primo" << endl;
	} else {
		cout << "Es compuesto" << endl;
	}
	
	
	
	
	return 0;
}

