function [ x ] = exactlinesearch_step(x0,func,dirs)

x=Point('Point');
[g,f]=func.oracle(x);
nb_orth=max(size(dirs));
func.AddConstraint((x-x0)*g<=0);
if isa(dirs,'cell')
    for i=1:nb_orth
        func.AddConstraint(dirs{i}*g<=0);
    end
else
    func.AddConstraint(dirs*g<=0);
end
end
