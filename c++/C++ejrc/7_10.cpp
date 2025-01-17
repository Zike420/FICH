#include <iostream>
using namespace std;

int main() {
	int N, Num, x, y, x1;
	cout << "ingrese un número natual, saldran sus pares menores a él" << endl;
	cin >> N;
	cout << "Ingrese 1 para ver de forma creciente o 2 para verlo de forma decreciente" << endl;
	cin >> Num;
	y=N;
	x=0;
	x1=1;
	if (Num == 1){
		if (N%2 == 0) {
			cout << "Pares:" << endl;
			cout << "0" << endl;
			while(x != N){
				++x;
				++x;
				if(x!=N){
					cout << x << endl;
				}
				
			} 
		} else {
			cout << "Pares:" << endl;
			cout << x1 << endl;
			while(x1 != N){
				++x1;
				++x1;
				if (x1 != N){
					cout << x1 << endl;
				}
				
			} 
			
		}
	}
	
	if (Num == 2){
		if (N%2 == 0) {
			cout << "Pares:" << endl;
			
			while(y != 0){
				--y;
				--y;
				cout << y << endl;
			} 
		}else {
				cout << "Pares:" << endl;
				
				while(y != 1){
					--y;
					--y;
					cout << y << endl;
			}
		}
	}
	
	return 0;
}

