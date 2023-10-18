Checking image registries in OCP is important for several reasons:
    - Image Availability: Checking the registry helps confirm that the necessary images are present and up-to-date.
    - Security: Ensuring only trusted and verified images are deployed within OCP cluster, reducing the risk of security breaches.
    - Resource Efficiency: Checking if an image already exists in the registry before pushing a new version, storage costs can be reduced. 

Goals:
- Getting the number and names of image registries (descriptive)
- Check status of image registry operator (informative)
- Check external images (informative)
- Check registry pods (informative)
- Check internal registry health (informative)
- Check persistent storage

