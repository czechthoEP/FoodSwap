import { Component, Input } from '@angular/core';
import { RestApiService } from '../shared/rest-api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {
  @Input() userDetails = {firstName: '', lastName: '', email: '', street: '', streetNr: '', city: '', password: ''};
  constructor(public restApi: RestApiService, public router: Router) {}
  
  ngOnInit() {}

  addEmployee(dataEmployee: any) {
    this.restApi.createEmployee(this.userDetails).subscribe((data: {}) => {
      this.router.navigate(['/employees-list']);
    });
  }

}
