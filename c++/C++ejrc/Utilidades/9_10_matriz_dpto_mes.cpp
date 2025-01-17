#include <iostream>
#include <matrix>
#include <iomanip>
using namespace std;

void mostrar(matrix<int> &m) {
	for(size_t dpto=0;dpto<m.size(0);++dpto) { 
		cout << "Departamento " << dpto+1 << " :" << endl;
		for(size_t mes=0;mes<m.size(1);++mes) { 
			cout << setw(5) << "|Mes " << mes+1 << " : " << m[dpto][mes] << "mm   ";
		}
		cout << " " << endl;
	}
	cout << endl;
}

int main() {
	matrix<int>m(5,12);
	for(int mes=0;mes<12;++mes) { 
		cout << "mes " << mes+1 << endl;
		for(int dpto=0;dpto<5;++dpto) {
			cout << "departamento " << dpto+1 << " : " << endl;
			cin >> m[dpto][mes];
		}
	}
	
	mostrar(m);
	
	for(int dpto=0;dpto<5;++dpto) { 
		int total=0, cant = 0;
		for(int mes=0;mes<12;++mes) { 
			if (m[dpto][mes]!=-1){
				total+=m[dpto][mes];
				++cant;
			}
		}
		int prom = total/cant;
		for(int mes=0;mes<12;++mes) { 
			if (m[dpto][mes]==-1){
				m[dpto][mes] = prom;
			}
		}
	}
	
	mostrar(m);
	
	m.resize(5,13);
	for(int dpto=0;dpto<5;++dpto) { 
		int total=0; 
		for(int mes=0;mes<12;++mes) { 
			total+=m[dpto][mes];
		}
		m[dpto][12] = total;
	}

	mostrar(m);
	
	return 0;
}

