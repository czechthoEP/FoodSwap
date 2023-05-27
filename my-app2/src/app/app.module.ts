import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { WidgetMakerComponent } from './widget-maker/widget-maker.component';
import { Page2Component } from './page2/page2.component';
import { Page3Component } from './page3/page3.component';
import { LoginComponent } from './login/login.component';
import { Page4Component } from './page4/page4.component';
import { Page5Component } from './page5/page5.component';

@NgModule({
  declarations: [
    AppComponent,
    WidgetMakerComponent,
    Page2Component,
    Page3Component,
    LoginComponent,
    Page4Component,
    Page5Component
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
