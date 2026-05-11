function goTo(id){document.getElementById(id).scrollIntoView({behavior:'smooth'})}
function tick(){var n=new Date();document.getElementById('utctime').textContent=String(n.getUTCHours()).padStart(2,'0')+':'+String(n.getUTCMinutes()).padStart(2,'0')+':'+String(n.getUTCSeconds()).padStart(2,'0')}
tick();setInterval(tick,1000);
function toast(msg){var t=document.getElementById('toast');document.getElementById('t-msg').textContent=msg;t.classList.add('on');setTimeout(function(){t.classList.remove('on')},3200)}
function closeModal(){document.getElementById('overlay').classList.remove('on');document.body.style.overflow=''}
document.addEventListener('keydown',function(e){if(e.key==='Escape')closeModal()});
function showChapter(id,btn){
  document.querySelectorAll('.chapter-panel').forEach(function(p){p.classList.remove('active')});
  document.querySelectorAll('.chapter-btn').forEach(function(b){b.classList.remove('active')});
  var panel=document.getElementById(id);if(panel)panel.classList.add('active');
  if(btn)btn.classList.add('active');
}
function getUsers(){try{return JSON.parse(localStorage.getItem('cmb_u')||'{}')}catch(e){return{}}}
function getSess(){return localStorage.getItem('cmb_s')}
function setMsg(msg,ok){var el=document.getElementById('form-msg');el.textContent=msg;el.style.color=ok?'var(--cyan)':'rgba(255,100,100,0.8)'}
function showAcc(u){document.getElementById('accForms').style.display='none';document.getElementById('accLogged').style.display='block';document.getElementById('accName').textContent=u.first+' '+u.last}
function hideAcc(){document.getElementById('accForms').style.display='block';document.getElementById('accLogged').style.display='none'}
function doRegister(){
  var first=document.getElementById('r-first').value.trim(),last=document.getElementById('r-last').value.trim(),email=document.getElementById('r-email').value.trim(),pass=document.getElementById('r-pass').value;
  if(!first||!last||!email||!pass){setMsg('// All fields required',false);return}
  if(!email.includes('@')){setMsg('// Invalid email',false);return}
  var u=getUsers();if(u[email]){setMsg('// Account exists -- sign in',false);return}
  u[email]={first:first,last:last,email:email,pass:pass,country:document.getElementById('r-country').value.trim(),joined:new Date().toISOString()};
  localStorage.setItem('cmb_u',JSON.stringify(u));localStorage.setItem('cmb_s',email);
  showAcc(u[email]);toast('// Pioneer registered: '+first+' '+last);
}
function doLogin(){
  var email=document.getElementById('l-email').value.trim(),pass=document.getElementById('l-pass').value;
  var u=getUsers();if(!u[email]||u[email].pass!==pass){setMsg('// Incorrect email or password',false);return}
  localStorage.setItem('cmb_s',email);showAcc(u[email]);toast('// Welcome back, '+u[email].first);
}
function doLogout(){localStorage.removeItem('cmb_s');hideAcc();toast('// Signed out')}
(function(){var e=getSess();if(e){var u=getUsers()[e];if(u)showAcc(u)}})();
function T(k){return(I18[CL]&&I18[CL][k])||(I18.EN[k])||k}
function applyLang(){
  document.querySelectorAll('[data-i18n-placeholder]').forEach(function(el){
    var v=T(el.getAttribute('data-i18n-placeholder'));
    if(v)el.placeholder=v;
  });
  document.querySelectorAll('[data-i18n]').forEach(function(el){
    var v=T(el.getAttribute('data-i18n'));
    if(v.includes('<'))el.innerHTML=v;else el.textContent=v;
  });
  document.dir=(CL==='AR'||CL==='HE'||CL==='FA')?'rtl':'ltr';
}
var LANG_META={
  EN:{flag:'\uD83C\uDDEC\uD83C\uDDE7',name:'English'},
  NL:{flag:'\uD83C\uDDF3\uD83C\uDDF1',name:'Nederlands'},
  DE:{flag:'\uD83C\uDDE9\uD83C\uDDEA',name:'Deutsch'},
  FR:{flag:'\uD83C\uDDEB\uD83C\uDDF7',name:'Fran\u00E7ais'},
  ES:{flag:'\uD83C\uDDEA\uD83C\uDDF8',name:'Espa\u00F1ol'},
  ZH:{flag:'\uD83C\uDDE8\uD83C\uDDF3',name:'\u4E2D\u6587'},
  JA:{flag:'\uD83C\uDDEF\uD83C\uDDF5',name:'\u65E5\u672C\u8A9E'},
  AR:{flag:'\uD83C\uDDF8\uD83C\uDDE6',name:'\u0627\u0644\u0639\u0631\u0628\u064A\u0629'},
  PT:{flag:'\uD83C\uDDF5\uD83C\uDDF9',name:'Portugu\u00EAs'},
  RU:{flag:'\uD83C\uDDF7\uD83C\uDDFA',name:'\u0420\u0443\u0441\u0441\u043A\u0438\u0439'},
  FIL:{flag:'\uD83C\uDDF5\uD83C\uDDED',name:'Filipino'},
  HI:{flag:'\uD83C\uDDEE\uD83C\uDDF3',name:'\u0939\u093F\u0928\u094D\u0926\u0940'},
  ID:{flag:'\uD83C\uDDEE\uD83C\uDDE9',name:'Bahasa Indonesia'},
  TR:{flag:'\uD83C\uDDF9\uD83C\uDDF7',name:'T\u00FCrk\u00E7e'},
  KO:{flag:'\uD83C\uDDF0\uD83C\uDDF7',name:'\uD55C\uAD6D\uC5B4'},
  IT:{flag:'\uD83C\uDDEE\uD83C\uDDF9',name:'Italiano'},
  PL:{flag:'\uD83C\uDDF5\uD83C\uDDF1',name:'Polski'},
  RO:{flag:'\uD83C\uDDF7\uD83C\uDDF4',name:'Rom\u00E2n\u0103'},
  SV:{flag:'\uD83C\uDDF8\uD83C\uDDEA',name:'Svenska'},
  CS:{flag:'\uD83C\uDDE8\uD83C\uDDFF',name:'\u010Ce\u0161tina'},
  VI:{flag:'\uD83C\uDDFB\uD83C\uDDF3',name:'Ti\u1EBFng Vi\u1EC7t'},
  UK:{flag:'\uD83C\uDDFA\uD83C\uDDE6',name:'\u0423\u043A\u0440\u0430\u0457\u043D\u0441\u044C\u043A\u0430'},
  FA:{flag:'\uD83C\uDDEE\uD83C\uDDF7',name:'\u0641\u0627\u0631\u0633\u06CC'},
  TH:{flag:'\uD83C\uDDF9\uD83C\uDDED',name:'\u0E44\u0E17\u0E22'},
  HE:{flag:'\uD83C\uDDEE\uD83C\uDDF1',name:'\u05E2\u05D1\u05E8\u05D9\u05EA'},
  EL:{flag:'\uD83C\uDDEC\uD83C\uDDF7',name:'\u0395\u03BB\u03BB\u03B7\u03BD\u03B9\u03BA\u03AC'},
  UR:{flag:'🇵🇰',name:'اردو'},
  BN:{flag:'🇧🇩',name:'বাংলা'},
  SW:{flag:'🇰🇪',name:'Kiswahili'}
}
function buildLS(){
  var el=document.getElementById('lang-switcher');
  var meta=LANG_META[CL]||LANG_META.EN;
  var options=LANGS.map(function(l){
    var m=LANG_META[l];
    return '<button class="lang-option'+(l===CL?' active':'')+'" data-lang="'+l+'" onclick="setLang(\''+l+'\')">'
      +'<span class="lang-flag">'+m.flag+'</span>'
      +'<span class="lang-code">'+l+'</span>'
      +'<span class="lang-name">'+m.name+'</span>'
      +'</button>';
  }).join('');
  el.innerHTML='<button class="lang-trigger" id="lang-trigger" onclick="toggleLangMenu(event)" aria-haspopup="listbox" aria-label="Language selector">'
    +'<span class="lang-flag">'+meta.flag+'</span>'
    +'<span class="lang-code">'+CL+'</span>'
    +'<svg class="lang-chevron" viewBox="0 0 12 12" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M3 4.5L6 7.5L9 4.5"/></svg>'
    +'</button>'
    +'<div class="lang-menu" id="lang-menu" role="listbox">'+options+'</div>';
}
function toggleLangMenu(e){
  if(e)e.stopPropagation();
  var t=document.getElementById('lang-trigger');
  var m=document.getElementById('lang-menu');
  if(!t||!m)return;
  t.classList.toggle('open');
  m.classList.toggle('open');
}
function closeLangMenu(){
  var t=document.getElementById('lang-trigger');
  var m=document.getElementById('lang-menu');
  if(t)t.classList.remove('open');
  if(m)m.classList.remove('open');
}
document.addEventListener('click',function(e){
  var sw=document.getElementById('lang-switcher');
  if(sw&&!sw.contains(e.target))closeLangMenu();
});
document.addEventListener('keydown',function(e){if(e.key==='Escape')closeLangMenu();});
function setLang(l){CL=l;applyLang();buildLS();}
function buildAlpha(){
  var letters=[...new Set(codexData.map(function(d){return d.letter}))].sort();
  document.getElementById('codex-alpha').innerHTML=letters.map(function(l){return '<button class="alpha-btn" data-l="'+l+'" onclick="filterByLetter(\''+l+'\')">'+l+'</button>';}).join('')+'<button class="alpha-btn" onclick="filterAll()">ALL</button>';
}
function filterByLetter(l){document.getElementById('cx-q').value='';filterCodex(l)}
function filterAll(){document.getElementById('cx-q').value='';filterCodex('')}
function openModal(id){
  var d=codexData.find(function(x){return x.id===id});if(!d)return;
  document.getElementById('m-lbl').textContent=d.cat+' \u00B7 '+cxT(d,'tag');
  document.getElementById('m-title').textContent=cxT(d,'name');
  document.getElementById('m-sub').textContent=cxT(d,'sum');
  document.getElementById('m-desc').textContent=cxT(d,'desc');
  document.getElementById('m-ref').textContent=d.ref?(T('cx.refs')||'References')+': '+d.ref:'';
  var specsWrap=document.querySelector('.m-specs');
  if(d.specs&&Object.keys(d.specs).length){
    document.getElementById('m-specs').innerHTML=Object.entries(d.specs).map(function(e){return '<div><div class="m-sk">'+e[0]+'</div><div class="m-sv">'+e[1]+'</div></div>';}).join('');
    if(specsWrap)specsWrap.style.display='';
  } else {
    document.getElementById('m-specs').innerHTML='';
    if(specsWrap)specsWrap.style.display='none';
  }
  document.getElementById('overlay').classList.add('on');
  document.body.style.overflow='hidden';
}

var sections=['vision','location','blueprint','phases','codex','support','account'];
var navAs=document.querySelectorAll('.nav-links a');
sections.forEach(function(id,i){
  var el=document.getElementById(id);if(!el)return;
  new IntersectionObserver(function(entries){entries.forEach(function(e){if(e.isIntersecting)navAs.forEach(function(a,j){a.classList.toggle('active',j===i)})})},{threshold:0.3}).observe(el);
});
document.querySelectorAll('.sr').forEach(function(el){
  new IntersectionObserver(function(entries){entries.forEach(function(e){if(e.isIntersecting)e.target.classList.add('in')})},{threshold:0.07,rootMargin:'0px 0px -30px 0px'}).observe(el);
});

var sl=localStorage.getItem('cmb_lang2')||'EN';
CL=LANGS.includes(sl)?sl:'EN';
// Reset corrupt taalstate
if(!sl||sl.length>3){localStorage.removeItem('cmb_lang2');CL='EN';}
buildLS();
applyLang();buildAlpha();
// Lazy render codex - alleen als sectie zichtbaar wordt
var codexRendered = false;
var codexSection = document.getElementById('codex');
if(codexSection) {
  var codexObserver = new IntersectionObserver(function(entries) {
    if(entries[0].isIntersecting && !codexRendered) {
      codexRendered = true;
      renderCodex(codexData);
    }
  }, {threshold: 0.01});
  codexObserver.observe(codexSection);
} else {
  renderCodex(codexData);
}
// ── Visitor counter (GoatCounter) ─────────────────────────────────────────
(function(){
  function gc(path,id){
    fetch('https://chrystalmoonbase.goatcounter.com/api/v0/stats/total?start='+path+'&end=2099-01-01',
      {headers:{'Content-Type':'application/json'}})
      .then(function(r){return r.json()})
      .then(function(d){if(d&&d.total!==undefined){var el=document.getElementById(id);if(el)el.textContent=d.total.toLocaleString();}})
      .catch(function(){});
  }
  var today=new Date().toISOString().split('T')[0];
  gc('2020-01-01','visitor-count');
  gc(today,'visit-today');
  var weekAgo=new Date(Date.now()-7*24*60*60*1000).toISOString().split('T')[0];
  fetch('https://chrystalmoonbase.goatcounter.com/api/v0/stats/total?start='+weekAgo+'&end='+today,
    {headers:{'Content-Type':'application/json'}})
    .then(function(r){return r.json()})
    .then(function(d){if(d&&d.total!==undefined){var el=document.getElementById('visit-week');if(el)el.textContent=d.total.toLocaleString();}})
    .catch(function(){});
})();
