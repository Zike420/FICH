#include <iostream>
#include <vector>
using namespace std;

float promedio(float a, float b);
float media120(vector<float>v);

int main() {
	int n;
	cout << "cantidad a registrar de temperatura" << endl;
	cin >> n;
	vector <float> v(n); 
	for(int i=0;i<n;++i) { 
		cout << "temperatura: ";
		cin >> v[i];
		cout << endl;
	}
	for(int i=0;i<n;++i) { 
		if (v[i]>=999.9) {
			v[i] = promedio(v[i-1], v[i+1]);
		}
	}
	
	float pro = media120(v);
	
	for(int i=0;i<n;++i) { 
		cout << v[i] << "  ";
	}
	cout << endl;
	cout << pro;
	return 0;
}

float promedio(float a, float b) {
	float prom = (a+b)/2;
	return (prom);
}
float media120(vector<float>v){
	float total=0;
	for(int i=0;i<120;++i) { 
		total += v[i];
	}
	float prom120 = total/120;
	return (prom120);
}
