function [B,C,D]= Interpolacion_cero(Ag1,k)
   
    n=length(Ag1);
    A=n*k;
    B=zeros(1,A);
    C=zeros(1,A);
    D=zeros(1,A);
    
    for i=1:1:n
        for j=i*k:k:A
            for b=1:1:k
                if b==1
                    B(j+b)=Ag1(i);
                else
                    B(j+b)=0;
                end
            end
        end
    end

    
   for i=1:1:n
        for j=i*k:k:A
            for b=1:1:k
                 C(j+b)=Ag1(i);

            end
        end
   end
   
   for i=1:1:n
       if i<n-1
           prom=(Ag1(i+1)-Ag1(i))/k;
       else 
           prom=(Ag1(i)+1)/k;
       end
       for j=i*k:k:A
            for b=1:1:k
                 D(j+b)=Ag1(i)+prom*(b-1);
            end
       end
   end   
B;
C;
D;

end

