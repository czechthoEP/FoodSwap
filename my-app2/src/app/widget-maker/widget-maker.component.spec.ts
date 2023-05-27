import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WidgetMakerComponent } from './widget-maker.component';

describe('WidgetMakerComponent', () => {
  let component: WidgetMakerComponent;
  let fixture: ComponentFixture<WidgetMakerComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [WidgetMakerComponent]
    });
    fixture = TestBed.createComponent(WidgetMakerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
