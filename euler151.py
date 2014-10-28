def cut(a2, a3, a4, a5):
    sheets = float(a2+a3+a4+a5)
    if sheets==0: return 0
    singles = 1 if sheets==1 and a5==0 else 0
    if a2: singles += a2*cut(a2-1, a3+1, a4+1, a5+1)
    if a3: singles += a3*cut(a2  , a3-1, a4+1, a5+1)
    if a4: singles += a4*cut(a2  , a3  , a4-1, a5+1)
    if a5: singles += a5*cut(a2  , a3  , a4  , a5-1)
    return singles/sheets
print round(cut(1, 1, 1, 1), 6)



Example,
(a2,a3,a4,a5)
in case of (0,1,0,1)
if (a3) and if(a5) will be true, and called.

so s will consist of the returns of the calls :
singles = 1 if sheets==1 and a5==0 else 0
a3 * (a2,a3-1,a4+1,a5+1)  = 1 * (0,0,1,2)
a5 * (a2,a3,a4,a5-1)      = 1 * (0,1,0,0)



Our function goes through every possible occurence.
It does this recursively,
It returns the chance of us reaching a single sheet
From the last state. This would normally also count the
occurences of a single a5 paper, but we exclude that In
our If -statement at the  3th line of the function.

at every call it calculates the chance of ending up at
a single-sheet occurence in the rest of the tree.
It does this by
in the end the whole function, returns the chance of us
reaching a single sheet, in the whole tree of possibilities.
