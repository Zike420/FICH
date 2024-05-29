entrada('Bombones de jamon').
entrada('Tarta de Atun').
entrada('Buñuelos de bacalao').
platoprincipal('Locro').
platoprincipal('Atados de repollo').
platoprincipal('Matambre con espinacas y parmesano').
postre('Dulce de batata').
postre('Torta moka').
postre('Alfajor norteño').
carta(A,B,C):- entrada(A), platoprincipal(B), postre(C).