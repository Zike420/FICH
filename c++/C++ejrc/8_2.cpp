#include <iostream>
using namespace std;
int primo(int n);

int main() {
	int m=2, x=1;
	
	do {
		int g= primo(m);
		if (g==0) {
			cout << m << endl;
			++x;
		} 
		++m;
	} while(x<=1000);
	
	return 0;
}

int primo(int n){
	int d, c=0;
	for(d=2 ; d<=(n/2);++d) {
		if (n%d==0) {
			++c;
		}
	}
	return (c);
}
