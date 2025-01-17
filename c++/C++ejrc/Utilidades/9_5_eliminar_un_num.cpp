#include <iostream>
#include <vector>
using namespace std;

int buscar(const vector<int> &v, int val){
	for (size_t i=0; i<v.size();++i){
		if (v[i]==val){
			return i;
		}
	}
	return -1;
}
	
	void eleminar (vector<int> &v, int pos){
		for(size_t i = pos+1;i<v.size();++i){
			v[i-1] = v[i];
			v.resize(v.size()-1);
		}
	}

int main() {
	int n;
	cin >> n;
	
	vector<int> v(n);
	for (int &x : v){
		cin >> x;
	}
	
	int pos = buscar(v,523);
	while(pos!=-1){
		eleminar (v, pos);
		pos = buscar(v,523);
	}
	
	
	for (int x : v){
		cout << x << "  ";
	}
	return 0;
}

