#include <iostream>
#include <vector>
using namespace std;

int main() {
	vector<float> notas(30);
	
	for(float una_nota : notas){
		cin >> una_nota;
	}
	
	float promedio = 0;
	
	for(float una_nota : notas){
		promedio += una_nota;
	}
	promedio = promedio/notas.size();
	cout << "" << endl;
	for(float una_nota : notas){
		if (una_nota>promedio){
			cout << una_nota << endl;
		}
	}
	return 0;
}
