entrada('Bombones de jamon').
entrada('Tarta de Atun').
entrada('Bu�uelos de bacalao').
platoprincipal('Locro').
platoprincipal('Atados de repollo').
platoprincipal('Matambre con espinacas y parmesano').
postre('Dulce de batata').
postre('Torta moka').
postre('Alfajor norte�o').
carta(A,B,C):- entrada(A), platoprincipal(B), postre(C).