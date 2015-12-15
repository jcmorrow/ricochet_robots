#RICOCHET ROBOTS!

 This is a clone of ricochet robots. I realized the other night that a ricochet robots board can at any time be represented by a graph. Each spot on the board has four other spots which it is connected to (though in the case of at least one of these the connection is usually to itself).



 Take the following board

        1 2 3 4 5 6 7 8 9 10
        _____________________
    A  |                     |
    B  |                     |
    C  |                     |
    D  |                     |
    E  |        _|           |
    F  |                     |
    G  |                     |
    H  |                     |
    I  |               |_    |
    J  |                     |
    K  |_____________________|
       
 A5 has connections to A1, A10, and E5, as well as to itself in the up direction (or maybe just no connection in that direction). I9 has connections to I10, A9, and itself in the two other directions.

 Of course, this graph mutates with each move, as the robots provide edges as well.