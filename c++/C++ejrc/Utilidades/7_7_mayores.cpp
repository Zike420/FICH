#include <iostream>
using namespace std;

int main() {
	int a, b, c;
	cin >> a >> b >> c;
	
	if (a>b){
		if (a>c){
			cout << "A es el mayor";
		} else {
			cout << "C es el mayor";
		}
		
	} else {
		
		if (b>c){
			cout << "B es el mayor";		
		} else {
			cout << "C es el mayor";
		}
	}
	
	return 0;
}

