#include <iostream>
#include <vector>
using namespace std;

int main() {
	vector<float> meses(12,0);
	int monto;
	cout << "Monto" << endl;
	cin >> monto;
	while(monto!=0) {
		int dia, mes;
		cout << "Día y mes" << endl;
		cin >> dia >> mes;
		meses[mes-1] += monto;
		cout << "Monto" << endl;
		cin >> monto;
	}
	
	for(size_t i=0;i<meses.size();++i) {
		cout << "Total del mes " << i+1  << " $"<< meses[i] << endl;
	}
	int mesmenor=999999, mesnum;
	for(size_t i=0;i<meses.size();++i) {
		if (meses[i]<mesmenor){
			mesmenor=meses[i];
			mesnum=i;
		}
	}
	cout << "El mes de menor aporte es el mes " << mesnum+1 << " con $" << mesmenor;
	return 0;
}

