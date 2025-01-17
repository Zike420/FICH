#include <iostream>
#include <vector>
using namespace std;

int buscar_pos(const vector<string> &palabra, string nueva);void insertar(vector<string> &palabra, string nueva, int pos);

int main() {
	vector<string> palabra(100);
	for(string &p : palabra){
		cin >> p;
	}
	string nueva;
	cin >> nueva;
	
	int pos = buscar_pos(palabra, nueva);
	insertar(palabra, nueva, pos);
	
	for(string p : palabra){
		cout << p << endl;
	}
	return 0;
}

int buscar_pos(const vector<string> &palabra, string nueva){
	int pos = 0;
	while (pos<palabra.size() and nueva>palabra[pos]){
		++pos;
	}
	return pos;
}
	
	
void insertar(vector<string> &palabra, string nueva, int pos){	
	palabra.resize(palabra.size()+1);
	for(int i = palabra.size()-1; i>pos; --i){
		palabra[i] = palabra[i-1];
	}
	palabra[pos] = nueva;
}
