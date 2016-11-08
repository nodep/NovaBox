md order

copy /y NovaBox_8645-B.Cu.gbl        order\NovaBox_8645.GBL
copy /y NovaBox_8645-B.Mask.gbs      order\NovaBox_8645.GBS
copy /y NovaBox_8645-B.SilkS.gbo     order\NovaBox_8645.GBO
copy /y NovaBox_8645-Edge.Cuts.gm1   order\NovaBox_8645.GKO
copy /y NovaBox_8645-F.Cu.gtl        order\NovaBox_8645.GTL
copy /y NovaBox_8645-F.Mask.gts      order\NovaBox_8645.GTS
copy /y NovaBox_8645-F.SilkS.gto     order\NovaBox_8645.GTO
copy /y NovaBox_8645.drl             order\NovaBox_8645.TXT

cd order

7za a -tzip NovaBox_8645 *.*
