usia65(fulan). 
usia65(samwan). 
over40(fulan). 
over40(samwan). 
disable(fulan). 
tunjangan(X, senior) :- usia65(X). 
tunjangan(X, tambahan) :- over40(X). 
tunjangan(X, disabilitas) :- disable(X). 
tunjangan(X, nihil) :- negasi(tunjangan(X,Y)).  
negasi(Goal) :- Goal, write('tidak ada'), !, fail. 
negasi(Goal). 