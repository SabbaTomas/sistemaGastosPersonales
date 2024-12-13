import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { HttpClient } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [HttpClientModule, ReactiveFormsModule],  // Importar módulos necesarios
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {
  title = 'gestion-finanzas';
  data: any;

  constructor(private http: HttpClient) {}

  ngOnInit() {
    // Aquí se puede consumir una API
    this.http.get('https://api.example.com/data').subscribe((response) => {
      this.data = response;
      console.log(this.data);
    });
  }
}