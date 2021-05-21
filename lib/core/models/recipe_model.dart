class RecipeModel {
  List<Recipes> recipes;

  RecipeModel({this.recipes});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      // ignore: deprecated_member_use
      recipes = new List<Recipes>();
      json['recipes'].forEach((v) {
        recipes.add(new Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipes {
  String id;
  String cn;
  String ct;
  String dc;
  String fn;
  bool fv;
  List<Ig> ig;
  List<String> inn;
  String pf;
  String pt;
  String sv;
  String tt;

  Recipes(
      {this.id,
      this.cn,
      this.ct,
      this.dc,
      this.fn,
      this.fv,
      this.ig,
      this.inn,
      this.pf,
      this.pt,
      this.sv,
      this.tt});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cn = json['cn'];
    ct = json['ct'];
    dc = json['dc'];
    fn = json['fn'];
    fv = json['fv'];
    if (json['ig'] != null) {
      // ignore: deprecated_member_use
      ig = new List<Ig>();
      json['ig'].forEach((v) {
        ig.add(new Ig.fromJson(v));
      });
    }
    inn = json['inn'].cast<String>();
    pf = json['pf'];
    pt = json['pt'];
    sv = json['sv'];
    tt = json['tt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cn'] = this.cn;
    data['ct'] = this.ct;
    data['dc'] = this.dc;
    data['fn'] = this.fn;
    data['fv'] = this.fv;
    if (this.ig != null) {
      data['ig'] = this.ig.map((v) => v.toJson()).toList();
    }
    data['inn'] = this.inn;
    data['pf'] = this.pf;
    data['pt'] = this.pt;
    data['sv'] = this.sv;
    data['tt'] = this.tt;
    return data;
  }
}

class Ig {
  String c;
  String n;
  String p;

  Ig({this.c, this.n, this.p});

  Ig.fromJson(Map<String, dynamic> json) {
    c = json['c'];
    n = json['n'];
    p = json['p'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c'] = this.c;
    data['n'] = this.n;
    data['p'] = this.p;
    return data;
  }
}
