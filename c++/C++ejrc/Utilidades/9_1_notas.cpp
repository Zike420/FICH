#include <iostream>
#include <vector>
using namespace std;

int main() {
	vector<float> notas(30);
	
	for(size_t i = 0; i<notas.size(); ++i){
		cin >> notas[i];
	}
	
	float promedio = 0;
	
	for(size_t i = 0; i<notas.size(); ++i){
		promedio = notas[i]+promedio;
	}
	promedio = promedio/notas.size();
	cout << "" << endl;
	for(size_t i = 0; i<notas.size(); ++i){
		if (notas[i]>promedio){
			cout << notas[i] << endl;
		}
	}
	return 0;
}

