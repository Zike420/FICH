#include <iostream>
#include <vector>
using namespace std;

int main() {
	vector<int> v(20);
	
	for(int &aleatorio : v){
		aleatorio = rand()%51 + 100;
	}
	
	for(int aleatorio : v){
		cout << aleatorio << "  ";
		cout << endl;
	}
	int m, p;
	cin >> m >> p;
	
	v.resize(v.size()+1);
	
	for(int i=v.size()-1; i>p ; --i){
		v[i]= v[i-1];
	}
	v[p]=m;
	for(int aleatorio : v){
		cout << aleatorio << "  ";
		cout << endl;
	}
	return 0;
}

