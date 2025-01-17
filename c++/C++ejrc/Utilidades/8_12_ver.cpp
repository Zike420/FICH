#include <iostream>
using namespace std;

int mcd(int a, int b){
	int res, y, x;
	if (a>b) {
		x = a-b;
		return (x);
	}
	
	if (b>a) {
		y = b-a;
		return (y);
	}
	
	if (a==b){
		res = b = a;
	}
	return res;
}
	
	
	int main() {
		int f, g;
		cin >> f >> g;
		cout << mcd(f,g);
		
		return 0;
	}
	
