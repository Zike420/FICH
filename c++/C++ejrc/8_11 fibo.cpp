#include <iostream>
using namespace std;

int fibo(int i){
	if (i<2) return i;
	return fibo(i-1)+fibo(i-2);
}

int main() {
	for(int i=0;i<20;++i){
		cout << fibo(i) << "  ";
	}
	
	
	
	return 0;
}

