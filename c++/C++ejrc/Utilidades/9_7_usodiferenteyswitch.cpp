#include <iostream>
#include <matrix>
#include <algorithm>
using namespace std;

struct participante {
	int dni;
	int pts_mat, pts_fis, pts_com;
	int total;
};

int main() {
	
	int n;
	cin >> n;
	
	vector<participante> v(n);
	
	for(int i=0;i<n;++i) { 
		int dni, nro;
		cin >> dni >> nro;
		v[nro-1].dni = dni;
	}
	
	for(participante &p : v){
		p.pts_mat = 0;
		p.pts_fis = 0;
		p.pts_com = 0;
	}
	
	
	int nro;
	cin >> nro;
	while (nro!=0){
		int prueba, pts;
		cin >> prueba >> pts;
		switch(prueba){
		case 1: v[nro-1].pts_mat = pts; break;
		case 2: v[nro-1].pts_fis = pts; break;
		case 3: v[nro-1].pts_com = pts; break;
		default: cout << "disiplina no valida" << endl;
		}
		cin >> nro;
	}
	
	for(int nro=0;nro<n;++nro) { 
		v[nro].total = v[nro].pts_mat+v[nro].pts_fis+v[nro].pts_com;
	}
	
	int nro_ganador = 0, nro_segundo = 1;
	if (v[1].total>v[0].total){
		swap(nro_ganador, nro_segundo);
	}
	for(int nro=2;nro<n;++nro) { 
		if (v[nro].total>v[nro_ganador].total){
			nro_segundo = nro_ganador;
			nro_ganador = nro;
		} else{
			if (v[nro].total>v[nro_segundo].total){
			nro_segundo = nro;
			}
		}
	}
	
	cout << "El participante que gano es el " << v[nro_ganador].dni << endl;
	cout << "El participante que obtuvo el segundo lugar " << v[nro_segundo].dni << endl;
	cout << "El ganador obtuvo los siguientes puntajes: " << endl;
	cout << "Matematicas: " << v[nro_ganador].pts_mat << endl;
	cout << "Fisica: " << v[nro_ganador].pts_fis << endl;
	cout << "Computacion: " << v[nro_ganador].pts_com << endl;
	
	return 0;
}

